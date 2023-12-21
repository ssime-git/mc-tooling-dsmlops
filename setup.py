# -*- coding: utf-8 -*-
import os

def create_init_files(root_dir):
    """Create __init__.py in each folder"""
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for dirname in dirnames:
            init_file = os.path.join(dirpath, dirname, '__init__.py')
            if not os.path.exists(init_file):
                with open(init_file, 'w') as f:
                    f.write('')
                    
def create_listed_folders(folders_list):
    """takes a list of folders names and create folders"""
    for folder in folders_list:
        if not os.path.exists(folder):
            os.makedirs(folder)
            print(f"Folder {folder} created")

if __name__ == "__main__":
    
    # list of folders to create __init__.py in
    folders = [
        "data",
        "models",
        "notebooks",
        "src"
    ]
    
    # Create folders
    create_listed_folders(folders)
    
    # Create __init__.py in each folder
    create_init_files('.')
    print("done!")