from django.urls import path
from . import views
from .views import (
    graficos_view,
    # Estado de pedidos
    actualizar_estado_pedido,
    crear_pedido,
    mis_pedidos,
    # Fin estado de pedidos
    plato_list,
    plato_create,
    plato_update,
    plato_delete,
    
    pagina_venta,
    comprar_plato,
    editar_encuesta,
    # Vista usuario estado pedidos
    ver_detalle_pedido,
    # FIn vista usuario estado pedidos
    visualizacion_encuestas,
    agregar_al_carrito,  
    restar_del_carrito,   
    eliminar_del_carrito, 
    lista_platos_semanales,
    crear_plato_semanal,
    editar_plato_semanal,
    eliminar_plato_semanal,
    votar_plato_semanal,

    #Modificacion de usuarios
    modificar_datos,

# Visualización admin de la lista de pedidos
    lista_pedidos,
    #reporte venta
    lista_pedidos,
    reporte_ventas,
)

urlpatterns = [
    path('', views.iniciar_sesion, name='iniciar_sesion'),  # Ruta de inicio de sesión
    path('plato_list/', plato_list, name='plato_list'),  # Ruta para listar platos
    path('nuevo/', plato_create, name='plato_create'),  # Ruta para crear un nuevo plato
    path('editar/<int:pk>/', plato_update, name='plato_update'),  # Ruta para editar un plato
    path('eliminar/<int:pk>/', plato_delete, name='plato_delete'),  # Ruta para eliminar un plato
  
    path('venta/', pagina_venta, name='pagina_venta'),  # Ruta para la página de venta
    path('comprar/<int:plato_id>/', comprar_plato, name='comprar_plato'),  # Ruta para comprar un plato
    path('agregar/<int:plato_id>/', agregar_al_carrito, name='agregar_al_carrito'),  # Ruta para agregar al carrito
    path('restar/<int:plato_id>/', restar_del_carrito, name='restar_del_carrito'), # Ruta para restar del carrito
    path('eliminar-del-carrito/<int:plato_id>/', eliminar_del_carrito, name='eliminar_del_carrito'), # Ruta para eliminar del carrito
    path('editar_encuesta/<int:encuesta_id>/', editar_encuesta, name='editar_encuesta'),  # Ruta para editar encuestas
    path('visualizar-encuestas/', visualizacion_encuestas, name='visualizar_encuestas'),  # Ruta para visualizar encuestas

    # Rutas para platos semanales
    path('platos/semanales/', lista_platos_semanales, name='lista_platos_semanales'),
    path('platos/semanales/nuevo/', crear_plato_semanal, name='crear_plato_semanal'),
    path('platos/semanales/editar/<int:pk>/', editar_plato_semanal, name='editar_plato_semanal'),
    path('platos/semanales/eliminar/<int:pk>/', eliminar_plato_semanal, name='eliminar_plato_semanal'),
    path('platos/semanales/votar/<int:plato_semanal_id>/', votar_plato_semanal, name='votar_plato_semanal'),


    #Metodo de pagos
    path('pago/', views.pago, name='pago'),
    path('confirmacion/<int:pedido_id>/', views.confirmacion_pedido, name='confirmacion_pedido'),

    # Modificacion de registro de usuarios
    path('modificar_datos/', modificar_datos, name='modificar_datos'),


    # Vista pedidos admin

    path('pedidos/', lista_pedidos, name='lista_pedidos'),

    path('pedidos/actualizar/<int:pedido_id>/', actualizar_estado_pedido, name='actualizar_estado_pedido'),
    # Vista pedidos usuario
    path('pedidos/detalle/<int:pedido_id>/', ver_detalle_pedido, name='ver_detalle_pedido'),

    
    
    path('mis_pedidos/', mis_pedidos, name='mis_pedidos'),


    path('crear_pedido/', crear_pedido, name='crear_pedido'),

    path('ocultar_plato/<int:plato_id>/', views.ocultar_plato, name='ocultar_plato'),

    ## REporte de ventas
    path('lista-pedidos/', lista_pedidos, name='lista_pedidos'),  # Asegúrate de tener esta vista
    path('reporte-ventas/', reporte_ventas, name='reporte_ventas'),  # URL para el reporte de ventas
    
    path('graficos/', graficos_view, name='graficos'),

    #### Acerca de nosotros
    path('acerca-de-nosotros/', views.acerca_de_nosotros, name='acerca_de_nosotros'),
    
]
