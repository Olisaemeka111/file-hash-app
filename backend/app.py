from flask import Flask, request, jsonify
from flask_cors import CORS  # Enable CORS for frontend-backend communication
import hashlib
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
CORS(app)  # Allow cross-origin requests

# Configuration
MAX_FILE_SIZE = 10 * 1024 * 1024  # 10 MB file size limit
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'docx', 'jpeg', 'gif'}

# Helper function to check if the file extension is allowed
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# Root route to prevent 404 error
@app.route('/')
def home():
    return "Welcome to the File Hashing Service! Use /upload to upload files.", 200

# Handle favicon requests to prevent unnecessary 404 errors
@app.route('/favicon.ico')
def favicon():
    return '', 204  # No Content response

# Route for file upload
@app.route('/upload', methods=['POST'])
def upload_file():
    # Check if a file is included in the request
    if 'file' not in request.files:
        return jsonify({"error": "No file provided"}), 400

    file = request.files['file']

    # Check if the file is empty
    if file.filename == '':
        return jsonify({"error": "Empty file provided"}), 400

    # Validate file extension
    if not allowed_file(file.filename):
        return jsonify({"error": "File type not allowed"}), 400

    # Validate file size
    file.seek(0, os.SEEK_END)  # Move cursor to end of file
    file_size = file.tell()  # Get file size
    file.seek(0)  # Reset cursor to start of file
    if file_size > MAX_FILE_SIZE:
        return jsonify({"error": f"File size exceeds the limit of {MAX_FILE_SIZE} bytes"}), 400

    # Secure the filename to prevent directory traversal attacks
    filename = secure_filename(file.filename)

    # Read the file content and compute the MD5 hash
    file_content = file.read()
    if not file_content:
        return jsonify({"error": "Empty file provided or cannot read file content"}), 400

    md5_hash = hashlib.md5(file_content).hexdigest()

    # Return the MD5 hash as a JSON response
    return jsonify({"filename": filename, "md5_hash": md5_hash})

# Error handler for 413 Payload Too Large
@app.errorhandler(413)
def request_entity_too_large(error):
    return jsonify({"error": f"File size exceeds the limit of {MAX_FILE_SIZE} bytes"}), 413

# Run the Flask app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)