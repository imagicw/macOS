import os
from cryptography.fernet import Fernet

currentDir = os.getcwd()

def decrypt(filename, key):
  fernet = Fernet(key)
  with open(filename, 'rb') as enc_file:
    encrypted = enc_file.read()

  decrypted = fernet.decrypt(encrypted)

  with open(filename, 'wb') as dec_file:
    dec_file.write(decrypted)
    
    
if "__main__":
  file = input('请输入文件名：')
  key = input('请输入解密密钥：')
  file_path = f"{currentDir}/{file}"
  decrypt(file_path, key)