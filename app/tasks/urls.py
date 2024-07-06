from django.urls import path
from tasks import views

urlpatterns = [
    path('', views.list_tasks, name='home_task'),
    path('new/', views.create_task, name='create_task'),
    path('delete_task/<int:task_id>/', views.delete_task, name='delete_task'),
]
