# Generated by Django 5.1.1 on 2024-10-06 18:37

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comercio', '0010_producto'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Carrito',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='ItemCarrito',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.PositiveIntegerField(default=1)),
                ('carrito', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comercio.carrito')),
                ('plato', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comercio.plato')),
            ],
            options={
                'unique_together': {('carrito', 'plato')},
            },
        ),
        migrations.DeleteModel(
            name='Producto',
        ),
        migrations.AddField(
            model_name='carrito',
            name='platos',
            field=models.ManyToManyField(through='comercio.ItemCarrito', to='comercio.plato'),
        ),
    ]
