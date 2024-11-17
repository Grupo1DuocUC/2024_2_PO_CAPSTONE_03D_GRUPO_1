from django.db import models
from django.contrib.auth.models import User

class Plato(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    disponible = models.BooleanField(default=True)
    imagen = models.ImageField(upload_to='platos/', blank=True, null=True)
    oculto = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.nombre} - ${self.precio:.2f}"

    def total_votos(self):
        """Cuenta el total de votos para este plato."""
        return Voto.objects.filter(plato_semanal__plato=self).count()

    def total_pedidos(self):
        """Cuenta el total de pedidos que incluyen este plato."""
        return DetallePedido.objects.filter(plato=self).count()
        

class Encuesta(models.Model):
    plato = models.ForeignKey(Plato, on_delete=models.CASCADE, related_name='encuestas')
    rating = models.IntegerField(choices=[(i, str(i)) for i in range(1, 6)])
    comentario = models.TextField(blank=True)

    def __str__(self):
        return f'Encuesta para {self.plato.nombre} - Rating: {self.rating}'

class Carrito(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    platos = models.ManyToManyField(Plato, through='ItemCarrito')

class ItemCarrito(models.Model):
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    plato = models.ForeignKey(Plato, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    class Meta:
        unique_together = ('carrito', 'plato')

class PlatoSemanal(models.Model):
    DIA_SEMANA_CHOICES = [
        ('Lunes', 'Lunes'),
        ('Martes', 'Martes'),
        ('Miércoles', 'Miércoles'),
        ('Jueves', 'Jueves'),
        ('Viernes', 'Viernes'),
        ('Sábado', 'Sábado'),
        ('Domingo', 'Domingo'),
    ]
    dia = models.CharField(max_length=9, choices=DIA_SEMANA_CHOICES)
    plato = models.ForeignKey(Plato, on_delete=models.CASCADE)
    comentario = models.TextField(blank=True)

    def __str__(self):
        return f"{self.dia}: {self.plato.nombre}"

    def total_votos(self):
        return Voto.objects.filter(plato_semanal=self).count()

class Voto(models.Model):
    plato_semanal = models.ForeignKey(PlatoSemanal, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha_voto = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Voto de {self.user.username} para {self.plato_semanal.plato.nombre} en {self.plato_semanal.dia}'
    
class Pedido(models.Model):
    ESTADO_CHOICES = [
        ('Preparando', 'Preparando 🍲'),
        ('En entrega ⛟', 'En entrega ⛟'),
        ('Entregado ✅', 'Entregado ✅'),
    ]
    usuario = models.ForeignKey(User, null=True, on_delete=models.CASCADE, related_name='pedidos')
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    direccion_envio = models.CharField(max_length=255)
    hora_entrega = models.CharField(max_length=20)
    pagado = models.BooleanField(default=False)
    fecha_pedido = models.DateTimeField(auto_now_add=True)
    estado = models.CharField(max_length=50, choices=ESTADO_CHOICES, default='Preparando')

    def __str__(self):
        return f'Pedido {self.id} - {self.estado}'

class DetallePedido(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, related_name='detalles')
    plato = models.ForeignKey(Plato, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"{self.cantidad} x {self.plato.nombre} - {self.subtotal:.2f}"
    















