# Generated by Django 4.2 on 2023-10-11 06:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gchalo', '0002_alter_route1_time_alter_route10_time_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Routedetails',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rno', models.IntegerField()),
                ('stop', models.CharField(max_length=50)),
                ('time', models.CharField(max_length=8)),
            ],
        ),
        migrations.DeleteModel(
            name='Route1',
        ),
        migrations.DeleteModel(
            name='Route10',
        ),
        migrations.DeleteModel(
            name='Route11',
        ),
        migrations.DeleteModel(
            name='Route12',
        ),
        migrations.DeleteModel(
            name='Route13',
        ),
        migrations.DeleteModel(
            name='Route14',
        ),
        migrations.DeleteModel(
            name='Route15',
        ),
        migrations.DeleteModel(
            name='Route16',
        ),
        migrations.DeleteModel(
            name='Route17',
        ),
        migrations.DeleteModel(
            name='Route18',
        ),
        migrations.DeleteModel(
            name='Route19',
        ),
        migrations.DeleteModel(
            name='Route2',
        ),
        migrations.DeleteModel(
            name='Route20',
        ),
        migrations.DeleteModel(
            name='Route21',
        ),
        migrations.DeleteModel(
            name='Route22',
        ),
        migrations.DeleteModel(
            name='Route23',
        ),
        migrations.DeleteModel(
            name='Route24',
        ),
        migrations.DeleteModel(
            name='Route25',
        ),
        migrations.DeleteModel(
            name='Route26',
        ),
        migrations.DeleteModel(
            name='Route27',
        ),
        migrations.DeleteModel(
            name='Route28',
        ),
        migrations.DeleteModel(
            name='Route29',
        ),
        migrations.DeleteModel(
            name='Route3',
        ),
        migrations.DeleteModel(
            name='Route30',
        ),
        migrations.DeleteModel(
            name='Route4',
        ),
        migrations.DeleteModel(
            name='Route5',
        ),
        migrations.DeleteModel(
            name='Route6',
        ),
        migrations.DeleteModel(
            name='Route7',
        ),
        migrations.DeleteModel(
            name='Route8',
        ),
        migrations.DeleteModel(
            name='Route9',
        ),
    ]
