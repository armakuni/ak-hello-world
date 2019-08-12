require 'pathname'
root = Pathname.new(File.expand_path('.', __dir__))

$LOAD_PATH << root
$LOAD_PATH << root.join('lib')

require 'api'

run HelloWorld::API
