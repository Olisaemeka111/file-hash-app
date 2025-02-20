import pytest
from app import app


@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client


# Test the "/" endpoint
def test_home(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Welcome to the File Hashing Service" in response.data


# Test uploading a file successfully
def test_upload_file(client):
    data = {
        'file': (pytest.lazy_fixture('file_path'), 'example.txt')
    }
    response = client.post('/upload', data=data)
    assert response.status_code == 200
    assert b"File uploaded successfully" in response.data


# Test failure case (no file uploaded)
def test_upload_no_file(client):
    response = client.post('/upload', data={})
    assert response.status_code == 400
    assert b"No file provided" in response.data
