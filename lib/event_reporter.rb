require 'csv'
require 'date'
require 'erb'
require 'yaml'

require_relative 'commands_module'
include Commands
require_relative 'find_module'
include Find
require_relative 'help_module'
include Help
require_relative 'load_file_module'
include LoadFile
require_relative 'phone_number'
require_relative 'er_queue_module'
include ERQueue
require_relative 'save_file_module'
include SaveFile
require_relative 'zipcodes'

run
