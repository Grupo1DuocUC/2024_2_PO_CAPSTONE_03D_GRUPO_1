# Generated by Django 5.1.1 on 2024-09-29 05:31

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comercio', '0008_encuesta'),
    ]

    operations = [
        migrations.AlterField(
            model_name='encuesta',
            name='plato',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='encuestas', to='comercio.plato'),
        ),
    ]
