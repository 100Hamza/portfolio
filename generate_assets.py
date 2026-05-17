import os

png_data = b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x08\x02\x00\x00\x00\x90wS\xde\x00\x00\x00\x0cIDAT\x08\xd7c\xbc\xbc\xbc\x00\x00\x03\x11\x01\x19\xce\xa4\x13\x00\x00\x00\x00IEND\xaeB`\x82'
pdf_data = b'%PDF-1.0\n1 0 obj<</Type/Catalog/Pages 2 0 R>>endobj 2 0 obj<</Type/Pages/Kids[3 0 R]/Count 1>>endobj 3 0 obj<</Type/Page/MediaBox[0 0 3 3]>>endobj\ntrailer<</Size 4/Root 1 0 R>>'

projects = ['puffless', 'shouse', 's24', 'kubrra', 'social', 'sunversum', 'innovated', 'spish', 'emp']

os.makedirs('assets/cv', exist_ok=True)
with open('assets/cv/hamza_cv.pdf', 'wb') as f:
    f.write(pdf_data)

for p in projects:
    path = f'assets/images/projects/{p}'
    os.makedirs(path, exist_ok=True)
    with open(f'{path}/1.png', 'wb') as f:
        f.write(png_data)
    with open(f'{path}/2.png', 'wb') as f:
        f.write(png_data)

print("Dummy assets generated successfully!")
