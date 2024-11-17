# Generated by Django 5.1.2 on 2024-11-10 01:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comercio', '0021_alter_pedido_estado'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pedido',
            name='estado',
            field=models.CharField(choices=[('Preparando tu pedido 🍲', 'Preparando'), ('En entrega 🚚', 'En entrega'), ('Entregado ✅', 'Entregado')], default='preparando', max_length=50),
        ),
    ]