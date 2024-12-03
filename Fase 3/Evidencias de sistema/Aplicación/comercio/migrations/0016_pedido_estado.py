# Generated by Django 5.1.2 on 2024-11-08 23:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comercio', '0015_detallepedido'),
    ]

    operations = [
        migrations.AddField(
            model_name='pedido',
            name='estado',
            field=models.CharField(choices=[('preparando', 'Preparando'), ('en_entrega', 'En entrega'), ('entregado', 'Entregado')], default='preparando', max_length=20),
        ),
    ]
