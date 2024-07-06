from django.test import TestCase

# Create your tests here.
from django.test import TestCase


from django.test import Client
from rest_framework import status


class PubliText(TestCase):
    """Public Text"""

    def setUp(self):
        self.client = Client()

    def test_tasks(self):
        """Test tastk"""
        res = self.client.get("/tasks/")
        self.assertEqual(res.status_code, status.HTTP_200_OK)
