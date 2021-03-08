#!/usr/bin/env python
import sys, argparse, logging

# Gather our code in a main() function
def main(args, loglevel):
  logging.basicConfig(format="%(levelname)s: %(message)s", level=loglevel)

  # TODO Replace this with your actual code.
  print "Hello there."
  logging.info("You passed an argument.")
  logging.debug("Your Argument: %s" % args.argument)

# Standard boilerplate to call the main() function to begin
# the program.
if __name__ == '__main__':
  parser = argparse.ArgumentParser(
                                    description = "Does a thing to some stuff.",
                                    epilog = "As an alternative to the commandline, params can be placed in a file, one per line, and specified on the commandline like '%(prog)s @params.conf'.",
                                    fromfile_prefix_chars = '@' )
  # TODO Specify your real parameters here.
  parser.add_argument(
                      "argument",
                      help = "pass ARG to the program",
                      metavar = "ARG")
  parser.add_argument(
                      "-v",
                      "--verbose",
                      help="increase output verbosity",
                      action="store_true")
  args = parser.parse_args()

  # Setup logging
  if args.verbose:
    loglevel = logging.DEBUG
    else:
      loglevel = logging.INFO

  main(args, loglevel)













#!/usr/bin/python
from subprocess import check_output
import argparse
import os
import sys


DEBUG = False


def get_remote_branches():
    cmd = '''for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="|%ai|%ar|%an|" $branch | head -n 1` $branch; done | sort'''
    print 'Getting remote branches...'
    output = run_cmd(cmd)
    for line in output.split('\n'):
        parts = line.split('|')
        if len(parts) == 5:
            branch = parts[4].replace(' origin/', '')
            question = 'Would you like to delete `{}` last modified {} ({}) ' \
                       'by {}? [y/N/a] '.format(branch, parts[1], parts[2], parts[3])
            answer = raw_input(question)
            if DEBUG:
                print 'Answer: ' + answer
            if answer.lower() == 'y':
                del_cmd = 'git push origin --delete {}'.format(branch)
                print del_cmd
            if answer.lower() == 'a':
                # abort
                exit()


def run_cmd(cmd):
    if DEBUG:
        print 'Command: {}'.format(cmd)
    output = check_output(cmd, shell=True)
    if DEBUG:
        print 'Output: \n' + output
    return output


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Delete remote branches from git')
    parser.add_argument('-a', '--author', default=None)
    parser.add_argument('-v', '--verbose', default=False)
