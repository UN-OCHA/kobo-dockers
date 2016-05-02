"""humble script to perform backups for kobotoolbox platform."""

import gzip
import os
import subprocess
import sys

MONGO = {'host': '127.0.0.1', 'port': 27019,
         'db': 'formhub', 'collection': 'instances'}
# not used yet
# 'user': 'user', 'password': 'password'}

PG = {'host': '127.0.0.1', 'port': 5432, 'db': 'kobo',
      'user': 'user', 'password': 'password'}

PLEASE = 'Please try again.\n'  # LOL


def rewrite_from_env():
    """rewrite connections parameters from env vars."""
    pass


def mongo_backup_docs(host=MONGO['host'], port=MONGO['port'], db=MONGO['db'],
                      collection=MONGO['collection'], archive='backup.bson'):
    """perform a simple full mongo backup."""
    cmd_line = ['mongodump', '--db', db, '--collection', db, '--out', archive]
    subprocess.call(cmd_line)


def mongo_backup_indexes():
    """perform a simple mongo indexes backup."""
    print_line = '"printjson(db.{}.getIndexes())"'.format(MONGO['collection'])
    cmd_line = ['mongo', '--quiet', 'eval', print_line, MONGO['db']]
    subprocess.call(cmd_line)


def mongo_restore():
    """perform a simple full mongo restore."""
    cmd_line = ['mongorestore', '--drop', '--db', 'formhub', '--collection',
                'instances', 'restore.bson']
    subprocess.call(cmd_line)


def pg_backup(host=PG['host'], port=PG['port'], db=PG['db'],
              user=PG['user'], password=PG['password']):
    """perform a simple posgtres backup."""
    archive_name = 'blahblah'
    # BACKUP['DIR'] + '/' + prefix + '.' + db + '.' + SUFFIX + '.plsql'
    sys.stdout.write('Archiving {} db under {}.gz\n'.format(db, archive_name))
    sys.stdout.flush()
    try:
        cmd = ['pg_dump', '-vFt']
        cmd_params = '-h {} -p {} -U {} -f {} {}'.format(host, port, user,
                                                         archive_name, db)
        with open(os.devnull, 'wb') as devnull:
            subprocess.call(cmd.extend(cmd_params.split()), stdout=devnull,
                            stderr=subprocess.STDOUT)
    except IOError:
        sys.stdout.write('Error on {} db backup... {}'.format(db, PLEASE))
        sys.stdout.flush()
    else:
        if os.path.isfile(archive_name):
            # compress it
            sys.stdout.write('compressing {}\n'.format(archive_name))
            sys.stdout.flush()
            compress_file(archive_name, remove=True)
        else:
            sys.stdout.write('{} not found\n'.format(archive_name))
            sys.stdout.flush()


def compress_file(f_in='', f_out='', remove=False):
    """compress f_in to f_out."""
    if not f_in:
        return False
    if not f_out:
        f_out = f_in + '.gz'
    try:
        with open(f_in, 'rb') as file_in:
            with gzip.open(f_out, 'wb') as file_out:
                file_out.writelines(file_in)
    except IOError:
        sys.stdout.write('Error compressing {}... {}'.format(f_in, PLEASE))
        sys.stdout.flush()
    else:
        if remove:
            # print(f_in)
            os.remove(f_in)


def main():
    """main stuff."""
    pass


if __name__ == '__main__':
    main()
