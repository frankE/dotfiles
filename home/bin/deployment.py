#!/usr/bin/env python3

import yaml
import os


config_file = '.deploy.yaml'


def find_path(path, config_file):
    abs_path = os.path.join(path, config_file)
    tail = 'a'
    while not os.path.isfile(abs_path) and path != '' and tail != '':
        path, tail = os.path.split(path)
        abs_path = os.path.join(path, config_file)
    if not os.path.isfile(abs_path):
        return None
    return path


def load_config(path, config_file):
    path = find_path(path, config_file)
    if path is None:
        return None
    with open(os.path.join(path, config_file), "r") as file:
        config = yaml.safe_load(file)
    if 'local' not in config.keys():
        config['local'] = path
    return config


def get_path_config(host_config, local_file):
    max_len = 0
    config = None
    for path_config in host_config['pathes']:
        if 'local' not in path_config:
            return path_config
        common = os.path.commonpath([path_config['local'], local_file])
        if len(common) > max_len:
            config = path_config
            max_len = len(common)
    return config


def get_remote_filename(config, host, local_file):
    host_config = config['hosts'][host]
    path_config = get_path_config(host_config, local_file)
    local_path = path_config.get('local') or config['local']
    relative_path = local_file.replace(local_path, "", 1)
    if path_config['remote'] == "":
        # return path relative to home directory if remote is empty
        return relative_path.lstrip("/")
    return os.path.join(path_config['remote'], relative_path.lstrip("/"))
