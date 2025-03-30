import sys
import subprocess
import json

runtime = f'python{sys.version_info.major}.{sys.version_info.minor}'
architecture = 'arm64'
platform = 'manylinux2014_aarch64'
main_directory = 'python_packages'
functions_directory = 'terraform/functions'
packages_directory = f'{functions_directory}/{main_directory}/python/lib/{runtime}/site-packages'

subprocess.run([
    'pip', 'install',
    '--requirement', 'requirements.txt',
    '--target', packages_directory,
    '--platform', platform,
    '--implementation', 'cp',
    '--only-binary', ':all:',
    '--quiet',
    '--upgrade'
])

packages = json.loads(subprocess.check_output([
    'pip', 'list',
    '--path', packages_directory,
    '--format', 'json'
]))

with open(file=f'{functions_directory}/python_packages_metadata.json', mode='w') as file:
    json.dump({
        'runtime': runtime,
        'architecture': architecture,
        'platform': platform,
        'directory': main_directory,
        'packages': { package['name']: package['version'] for package in packages }
    }, file, indent=4)