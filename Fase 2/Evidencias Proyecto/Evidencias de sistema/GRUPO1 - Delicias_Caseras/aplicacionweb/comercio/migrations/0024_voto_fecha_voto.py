# Generated by Django 5.1.2 on 2024-11-10 06:35

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comercio', '0023_alter_pedido_estado'),
    ]

    operations = [
        migrations.AddField(
            model_name='voto',
            name='fecha_voto',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
