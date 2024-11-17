from django import forms
from .models import Pedido, Plato, Encuesta, PlatoSemanal
from django.core.exceptions import ValidationError

class PlatoForm(forms.ModelForm):
    class Meta:
        model = Plato
        fields = ['nombre', 'descripcion', 'precio', 'disponible', 'imagen']

class EncuestaForm(forms.ModelForm):
    class Meta:
        model = Encuesta
        fields = ['rating', 'comentario']

    def clean_rating(self):
        rating = self.cleaned_data.get('rating')
        if rating < 1 or rating > 5:
            raise forms.ValidationError("La calificación debe estar entre 1 y 5.")
        return rating

class PlatoSemanalForm(forms.ModelForm):
    class Meta:
        model = PlatoSemanal
        fields = ['dia', 'plato', 'comentario']

from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class RegistroForm(UserCreationForm):
    email = forms.EmailField(required=True, label='Correo')

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

class UserUpdateForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput, required=False, label='Nueva contraseña')

    class Meta:
        model = User
        fields = ['username', 'email', 'password']

    def clean_username(self):
        username = self.cleaned_data.get('username')
        if User.objects.filter(username=username).exclude(id=self.instance.id).exists():
            raise ValidationError("No se puede cambiar a ese nombre de usuario porque ya está ocupado.")
        return username

#### Formulario tarjeta de credito/debito:

from django import forms

class PagoForm(forms.Form):
    direccion_envio = forms.CharField(max_length=255, required=True)
    hora_entrega = forms.ChoiceField(choices=[
        ('12:00-13:00', '12:00 a 13:00'),
        ('13:01-14:00', '13:01 a 14:00'),
        ('14:01-15:00', '14:01 a 15:00'),
    ])
    numero_tarjeta = forms.CharField(max_length=16, required=True)
    fecha_expiracion = forms.CharField(max_length=5, required=True)
    cvc = forms.CharField(max_length=3, required=True)

    def clean_fecha_expiracion(self):
        fecha_expiracion = self.cleaned_data['fecha_expiracion']
        try:
            mes, anio = map(int, fecha_expiracion.split('/'))
            if not (1 <= mes <= 12):
                raise forms.ValidationError("El mes debe estar entre 01 y 12.")
        except ValueError:
            raise forms.ValidationError("Formato inválido. Use MM/AA.")
        
        from datetime import datetime
        ahora = datetime.now()
        if anio < ahora.year % 100 or (anio == ahora.year % 100 and mes < ahora.month):
            raise forms.ValidationError("La tarjeta ha expirado.")

        return fecha_expiracion

## formulario estado pedido

class EstadoPedidoForm(forms.ModelForm):
    class Meta:
        model = Pedido
        fields = ['estado']

# Formulario de envio y direccion
class PedidoForm(forms.Form):
    direccion_envio = forms.CharField(max_length=255)
    hora_entrega = forms.CharField(max_length=20)