import os
import datetime
import zipfile
from cryptography.fernet import Fernet
from aligo import Aligo, EMailConfig

currentDir = os.getcwd()

def encrypt(filename, key):
  fernet = Fernet(key)
  with open(filename, 'rb') as file:
    origin_file = file.read()
  
  encrypted = fernet.encrypt(origin_file)
  
  with open(filename, 'wb') as enc_file:
    enc_file.write(encrypted)

def backup_data(paths):
  # 创建一个压缩文件夹
  today = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
  file_path = f"{currentDir}/pi_backup_{today}.zip"
  backup_file = zipfile.ZipFile(file_path, "w")

  # 依次添加目录到压缩包
  for path in paths:
    print('正在备份 {}'.format(path))
    for root, dirs, files in os.walk(path):
      print('正在备份 {}'.format(root))
      for file in files:
        print('正在备份 {}'.format(file))
        backup_file.write(os.path.join(root, file))

  print('备份完成 pi_backup_{}.zip'.format(today))
  backup_file.close()
  
  print('正在加密 pi_backup_{}.zip'.format(today))
  key = Fernet.generate_key() # 自动生成密钥
  # key = b'your_key_here' # 手动设置密钥
  encrypt(file_path, key)
  
  print('加密完成 pi_backup_{}.zip 密钥{}'.format(today, key))
  
  upload_to_alipan(file_path)
  
def upload_to_alipan(file):
  email_config = EMailConfig(
    email='xxx@xxx.xxx', # 接收人邮箱
    user='xxx@xxx.xxx', # 发件人邮箱
    password='your_password', # 发件人邮箱密码
    host='smtp_host_url', # 发件服务器地址
    port=465
  )
  
  ali = Aligo(email=email_config)
  remote_folder = ali.get_folder_by_path('pi-backup')
  ali.upload_file(file, parent_file_id=remote_folder.file_id)

if __name__ == "__main__":
  # 备份位置
  backup_paths = [
    '/home/imagic/bitwarden',
    '/opt/1panel/backup',
    '/home/imagic/memos',
    '/home/imagic/qinglong'
  ]
  
  # 执行备份
  backup_data(backup_paths)