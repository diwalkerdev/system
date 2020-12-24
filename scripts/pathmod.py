#!/usr/bin/env python3
import os
import sys
from collections import deque

import click

DEFAULT = ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']


def prepend_(path, item):
    _remove(path, item)
    path.appendleft(item)
    return path


def append_(path, item):
    _remove(path, item)
    path.append(item)
    return path


def remove_(path, item):
    _remove(path, item)
    return path


def _remove(path, item):
    while path.count(item):
        path.remove(item)


def _join(path):
    return ':'.join(path)


@click.group()
def cli():
    pass


@click.command()
def default(show):
    """Restores the path to /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"""
    out = ':'.join(DEFAULT)
    sys.stdout.write('export PATH=' + out)


@click.command()
@click.option("--current", '-c', is_flag=True, default=True, help='Omits the current path')
@click.option("--default", '-d', is_flag=True, default=False, help='Shows the default path')
def show(current, default):
    """Shows PATH information. Current is the default."""
    out = '\n'
    if current:
        out = os.environ['PATH'] + '\n'
    if default:
        out = ':'.join(DEFAULT) + '\n'
    sys.stdout.write(out)


@click.command()
@click.option("--prepend", '-p', help='Adds item to the front of path and removes other occurrences.')
@click.option("--append", '-a', help='Adds item to the back of path and removes other occurrences.')
@click.option("--remove", '-r', help='Removes any occurrence of item from the path.')
def change(prepend, append, remove):
    """Changes the path based OPTIONS"""
    path = deque(os.environ['PATH'].split(':'))

    if prepend:
        path = prepend_(path, prepend)

    if append:
        path = append_(path, append)

    if remove:
        path = remove_(path, remove)

    if prepend or append or remove:
        sys.stdout.write('export PATH=' + ':'.join(path))


cli.add_command(default)
cli.add_command(show)
cli.add_command(change)
cli()
