# -*- mode: python -*-

block_cipher = None

a = Analysis(['E:\\Godwin\\Programming\\build\\install.py'],
             pathex=['C:\\Users\\CHARITY PRODUCTIONS\\Anaconda4\\Scripts'],
             binaries=[],
             datas=[('E:\\Godwin\\Programming\\build\\exe', 'exe')],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          exclude_binaries=False,
          name='install',
          icon='E:\\Godwin\\Programming\\build\\icon.ICO',
          debug=False,
          strip=False,
          upx=False,
          console=True )
coll = COLLECT(name='install')
