from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from .models import DetallePedido, Pedido, Plato, Encuesta, Carrito, ItemCarrito, PlatoSemanal, Voto
from .forms import EstadoPedidoForm, PagoForm, PedidoForm, PlatoForm, EncuestaForm, PlatoSemanalForm, RegistroForm, UserUpdateForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.utils import timezone
from django.db.models import Count, Sum
from django.views.decorators.http import require_POST

# Verificación de usuario administrador
def es_administrador(user):
    return user.is_staff

# Función para votar por un plato semanal
@login_required
def votar_plato_semanal(request, plato_semanal_id):
    plato_semanal = get_object_or_404(PlatoSemanal, pk=plato_semanal_id)
    
    if request.method == 'POST':
        if Voto.objects.filter(plato_semanal=plato_semanal, user=request.user).exists():
            messages.warning(request, 'Ya has votado por este plato.')
        else:
            Voto.objects.create(plato_semanal=plato_semanal, user=request.user)
            messages.success(request, '¡Gracias por tu voto!')
        return redirect('lista_platos_semanales')
    
    return render(request, 'comercio/votar_plato_semanal.html', {'plato_semanal': plato_semanal})

# Lista de platos semanales
def lista_platos_semanales(request):
    platos_semanales = PlatoSemanal.objects.all()
    return render(request, 'comercio/platosemana.html', {'platos_semanales': platos_semanales})

# Vista principal
def index(request):
    return render(request, 'index.html')

# Registro de usuario
def registro(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            try:
                user = form.save()
                login(request, user)
                return redirect('iniciada')
            except IntegrityError:
                return render(request, 'registro.html', {
                    'form': form,
                    "error": 'El usuario ya existe.'
                })
        return render(request, 'registro.html', {
            'form': form,
            "error": 'Las contraseñas no coinciden.'
        })
    else:
        form = RegistroForm()
    return render(request, 'registro.html', {'form': form})

@login_required
def iniciada(request):
    return render(request, 'iniciada.html')

def logout_view(request):
    logout(request)
    return redirect(request.GET.get('next', '/'))

def iniciar_sesion(request):
    if request.method == 'POST':
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            return render(request, 'iniciar.html', {
                'form': AuthenticationForm(),
                'error': 'Usuario o contraseña incorrectos.'
            })
        login(request, user)
        return redirect('iniciada')
    return render(request, 'iniciar.html', {'form': AuthenticationForm()})

# Nueva función para listar platos visibles
def lista_platos(request):
    platos = Plato.objects.filter(oculto=False)
    return render(request, 'comercio/lista_de_platos.html', {'platos': platos})

# Modificar la función de listar todos los platos
def lista_de_platos(request):
    return lista_platos(request)

def pagina_venta(request):
    platos = Plato.objects.filter(oculto=False)
    total = 0
    platos_carrito = []

    if request.user.is_authenticated:
        carrito, created = Carrito.objects.get_or_create(user=request.user)
        items = ItemCarrito.objects.filter(carrito=carrito)
        for item in items:
            subtotal = item.plato.precio * item.cantidad
            total += subtotal
            platos_carrito.append({
                'plato': item.plato,
                'cantidad': item.cantidad,
                'subtotal': subtotal,
            })

    form = EncuestaForm()
    if request.method == 'POST':
        form = EncuestaForm(request.POST)
        if form.is_valid():
            encuesta = form.save(commit=False)
            encuesta.plato = get_object_or_404(Plato, id=request.POST['plato_id'])
            encuesta.save()
            messages.success(request, '¡Gracias por tu encuesta!')
            return redirect('pagina_venta')

    return render(request, 'comercio/pagina_venta.html', {
        'platos': platos,
        'platos_carrito': platos_carrito,
        'total': total,
        'form': form
    })

def agregar_al_carrito(request, plato_id):
    if request.user.is_authenticated:
        plato = get_object_or_404(Plato, id=plato_id)
        carrito, created = Carrito.objects.get_or_create(user=request.user)
        item, created = ItemCarrito.objects.get_or_create(carrito=carrito, plato=plato)

        if not created:
            item.cantidad += 1
        item.save()
    else:
        messages.error(request, 'Debes iniciar sesión para agregar platos al carrito.')
    
    return redirect('pagina_venta')

def restar_del_carrito(request, plato_id):
    if request.user.is_authenticated:
        carrito = get_object_or_404(Carrito, user=request.user)
        item = get_object_or_404(ItemCarrito, carrito=carrito, plato_id=plato_id)

        if item.cantidad > 1:
            item.cantidad -= 1
        else:
            item.delete()
    
        item.save()
    return redirect('pagina_venta')

def eliminar_del_carrito(request, plato_id):
    if request.user.is_authenticated:
        carrito = get_object_or_404(Carrito, user=request.user)
        item = get_object_or_404(ItemCarrito, carrito=carrito, plato_id=plato_id)
        item.delete()

    return redirect('pagina_venta')

def editar_encuesta(request, encuesta_id):
    encuesta = get_object_or_404(Encuesta, id=encuesta_id)
    
    if request.method == "POST":
        form = EncuestaForm(request.POST, instance=encuesta)
        if form.is_valid():
            form.save()
            messages.success(request, 'Encuesta actualizada con éxito.')
            return redirect('pagina_venta')
    else:
        form = EncuestaForm(instance=encuesta)

    return render(request, 'comercio/encuesta_form.html', {'form': form})

def visualizacion_encuestas(request):
    platos = Plato.objects.all()
    resultados = []

    for plato in platos:
        encuestas = plato.encuestas.all()
        total_rating = sum(encuesta.rating for encuesta in encuestas) if encuestas.exists() else 0
        cantidad_encuestas = encuestas.count()
        promedio_rating = total_rating / cantidad_encuestas if cantidad_encuestas > 0 else 0

        resultados.append({
            'plato': plato,
            'total_rating': total_rating,
            'promedio_rating': promedio_rating,
            'cantidad_encuestas': cantidad_encuestas,
        })

    resultados.sort(key=lambda x: x['promedio_rating'], reverse=True)

    return render(request, 'visualizacion_encuestas.html', {'resultados': resultados})

def comprar_plato(request, plato_id):
    plato = get_object_or_404(Plato, id=plato_id)
    messages.success(request, f'Has comprado {plato.nombre} por ${plato.precio}.')
    return redirect('pagina_venta')

@login_required
@permission_required('is_superuser')
def plato_list(request):
    platos = Plato.objects.filter(oculto=False)
    return render(request, 'comercio/plato_list.html', {'platos': platos})

@user_passes_test(es_administrador)
@login_required
def plato_create(request):
    if request.method == "POST":
        form = PlatoForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Plato creado con éxito.')
            return redirect('plato_list')
    else:
        form = PlatoForm()
    return render(request, 'comercio/plato_form.html', {'form': form})

@login_required
@permission_required('is_superuser')
def plato_update(request, pk):
    plato = get_object_or_404(Plato, pk=pk)
    if request.method == "POST":
        form = PlatoForm(request.POST, instance=plato)
        if form.is_valid():
            form.save()
            messages.success(request, '')
            return redirect('plato_list')
    else:
        form = PlatoForm(instance=plato)
    return render(request, 'comercio/plato_form.html', {'form': form})

@login_required
@permission_required('is_superuser')
def plato_delete(request, pk):
    plato = get_object_or_404(Plato, pk=pk)
    if request.method == "POST":
        plato.delete()
        messages.success(request, '')
        return redirect('plato_list')
    return render(request, 'comercio/plato_confirm_delete.html', {'plato': plato})

def crear_plato_semanal(request):
    if request.method == 'POST':
        form = PlatoSemanalForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('lista_platos_semanales')
    else:
        form = PlatoSemanalForm()
    return render(request, 'comercio/plato_semanal_form.html', {'form': form})

def editar_plato_semanal(request, pk):
    plato_semanal = get_object_or_404(PlatoSemanal, pk=pk)
    if request.method == 'POST':
        form = PlatoSemanalForm(request.POST, instance=plato_semanal)
        if form.is_valid():
            form.save()
            return redirect('lista_platos_semanales')
    else:
        form = PlatoSemanalForm(instance=plato_semanal)
    return render(request, 'comercio/plato_semanal_form.html', {'form': form})

def eliminar_plato_semanal(request, pk):
    plato_semanal = get_object_or_404(PlatoSemanal, pk=pk)
    if request.method == 'POST':
        plato_semanal.delete()
        return redirect('lista_platos_semanales')
    return render(request, 'comercio/plato_semanal_confirm_delete.html', {'plato_semanal': plato_semanal})

# esto de aca modificar el registro de usuarios
@login_required
def modificar_datos(request):
    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=request.user)
        if form.is_valid():
            user = form.save(commit=False)
            password = form.cleaned_data.get('password')
            if password:
                user.set_password(password)
            user.save()
            return redirect('/')
    else:
        form = UserUpdateForm(instance=request.user)

    return render(request, 'modificar_datos.html', {'form': form})
# Fin modificación de registro de usuarios

###################### pagos ######################
@login_required
def pago(request):
    carrito = get_object_or_404(Carrito, user=request.user)
    if request.method == 'POST':
        form = PagoForm(request.POST)
        if form.is_valid():
            direccion_envio = form.cleaned_data['direccion_envio']
            hora_entrega = form.cleaned_data['hora_entrega']
            ### Crear el pedido y asociarlo al usuario
            pedido = Pedido.objects.create(
                usuario=request.user,
                carrito=carrito,
                direccion_envio=direccion_envio,
                hora_entrega=hora_entrega,
                pagado=True
            )
            # ##Guardar los detalles del pedido
            for item in carrito.itemcarrito_set.all():
                DetallePedido.objects.create(
                    pedido=pedido,
                    plato=item.plato,
                    cantidad=item.cantidad,
                    precio_unitario=item.plato.precio,
                    subtotal=item.plato.precio * item.cantidad
                )
            ### Limpiar el carrito después de la compra
            carrito.itemcarrito_set.all().delete() 

            messages.success(request, '')
            return redirect('confirmacion_pedido', pedido_id=pedido.id)
    else:
        form = PagoForm()

    return render(request, 'comercio/pago.html', {'form': form})

@login_required
def confirmacion_pedido(request, pedido_id):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    return redirect(f'/pedidos/detalle/{pedido_id}/')

### Vista de pedidos para el admin
@login_required
@user_passes_test(es_administrador)
def lista_pedidos(request):
    # ##Ordenar los pedidos por fecha de manera descendente
    pedidos = Pedido.objects.all().order_by('-fecha_pedido')
    pedidos_info = []

    for pedido in pedidos:
        total = sum(detalle.subtotal for detalle in pedido.detalles.all())
        pedidos_info.append({
            'pedido': pedido,
            'total': total,
            'detalles': pedido.detalles.all(),
        })

    return render(request, 'comercio/lista_pedidos.html', {'pedidos_info': pedidos_info})

#### Estado de pedidos:
@login_required
@user_passes_test(es_administrador)
@require_POST
def actualizar_estado_pedido(request, pedido_id):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    nuevo_estado = request.POST.get('estado')

    if nuevo_estado in ['Preparando', 'En entrega', 'Entregado']:
        pedido.estado = nuevo_estado
        pedido.save()
        messages.success(request, 'Estado del pedido actualizado.')
    else:
        messages.error(request, 'Estado no válido.')

    return redirect('lista_pedidos')

###### Vista pedidos por usuario:
def ver_detalle_pedido(request, pedido_id):
    pedido = get_object_or_404(Pedido, id=pedido_id)
    detalles = pedido.detalles.all()    
    # ##Calcular el total de la compra
    total_compra = detalles.aggregate(total=Sum('subtotal'))['total'] or 0
    return render(request, 'detalle_pedido.html', {'pedido': pedido, 'detalles': detalles, 'total_compra': total_compra})

###vista para el usuario
def mis_pedidos(request):
    if request.user.is_authenticated:
        pedidos = request.user.pedidos.all()
    else:
        pedidos = []
    return render(request, 'mis_pedidos.html', {'pedidos': pedidos})

# ##Crear pedidos
def crear_pedido(request):
    if request.method == 'POST':
        form = PedidoForm(request.POST)
        if form.is_valid():
            direccion_envio = form.cleaned_data['direccion_envio']
            hora_entrega = form.cleaned_data['hora_entrega']
            ### Obtener el carrito del usuario autenticado
            carrito = Carrito.objects.get(user=request.user)
            ### Crear el nuevo pedido asociado al usuario
            nuevo_pedido = Pedido(
                usuario=request.user,
                carrito=carrito,
                direccion_envio=direccion_envio,
                hora_entrega=hora_entrega
            )
            nuevo_pedido.save()
            # Agregar detalles al pedido
            for item in carrito.itemcarrito_set.all():
                DetallePedido.objects.create(
                    pedido=nuevo_pedido,
                    plato=item.plato,
                    cantidad=item.cantidad,
                    precio_unitario=item.plato.precio,
                    subtotal=item.cantidad * item.plato.precio
                )
            # Opcional: Vaciar el carrito después de crear el pedido
            carrito.platos.clear()
            # Redirigir a la lista de pedidos
            return redirect('mis_pedidos')
    else:
        form = PedidoForm()
    return render(request, 'crear_pedido.html', {'form': form})

def ocultar_plato(request, plato_id):
    if request.method == 'POST':
        plato = get_object_or_404(Plato, pk=plato_id)
        plato.oculto = True
        plato.save()
    return redirect('plato_list')
############ Reportes de ventas
def reporte_ventas(request):
    hoy = timezone.now().date()
    # Calcular el total de ventas del día de hoy
    ventas_diarias = DetallePedido.objects.filter(
        pedido__fecha_pedido__date=hoy
    ).aggregate(total_ventas=Sum('subtotal'))
    # Calcular el total de ventas de la última semana
    ventas_semanales = DetallePedido.objects.filter(
        pedido__fecha_pedido__gte=hoy - timezone.timedelta(days=7)
    ).aggregate(total_ventas=Sum('subtotal'))
    context = {
        'ventas_diarias': ventas_diarias['total_ventas'] or 0,
        'ventas_semanales': ventas_semanales['total_ventas'] or 0,
    }
    return render(request, 'comercio/reporte_ventas.html', context)

######grafitcos#####
@login_required
@user_passes_test(es_administrador)
def graficos_view(request):
    hoy = timezone.now().date()
    hace_una_semana = hoy - timezone.timedelta(days=7)
    # Datos diarios
    votos_diarios = Voto.objects.filter(fecha_voto__date=hoy).values('plato_semanal__plato__nombre').annotate(total=Count('id'))
    pedidos_diarios = DetallePedido.objects.filter(pedido__fecha_pedido__date=hoy).values('plato__nombre').annotate(total_vendidos=Sum('cantidad'))

    # Datos semanales
    votos_semanales = Voto.objects.filter(fecha_voto__gte=hace_una_semana).values('plato_semanal__plato__nombre').annotate(total=Count('id'))
    pedidos_semanales = DetallePedido.objects.filter(pedido__fecha_pedido__gte=hace_una_semana).values('plato__nombre').annotate(total_vendidos=Sum('cantidad'))

    context = {
        'votos_diarios': list(votos_diarios),
        'pedidos_diarios': list(pedidos_diarios),
        'votos_semanales': list(votos_semanales),
        'pedidos_semanales': list(pedidos_semanales),
    }
    return render(request, 'graficos.html', context)

### Acerca de nosotros:
def acerca_de_nosotros(request):
    return render(request, 'acerca_de_nosotros.html')