#!/usr/bin/env ruby
# 
# == Cloud Servers API
# ==== Connects Ruby Applications to Rackspace's {Cloud Servers service}[http://www.rackspacecloud.com/cloud_hosting_products/servers]
# By H. Wade Minter <wade.minter@rackspace.com> and Mike Mayo <mike.mayo@rackspace.com>
#
# See COPYING for license information.
# Copyright (c) 2009, Rackspace US, Inc.
# ----
# 
# === Documentation & Examples
# To begin reviewing the available methods and examples, peruse the README.rodc file, or begin by looking at documentation for the 
# CloudServers::Connection class.
#
# The CloudServers class is the base class.  Not much of note aside from housekeeping happens here.
# To create a new CloudServers connection, use the CloudServers::Connection.new('user_name', 'api_key') method.

module CloudServers

  VERSION = IO.read(File.dirname(__FILE__) + '/../VERSION')
  require 'net/http'
  require 'net/https'
  require 'uri'
  require 'rubygems'
  require 'json'

  unless "".respond_to? :each_char
    require "jcode"
    $KCODE = 'u'
  end

  $:.unshift(File.dirname(__FILE__))
  require 'cloudservers/authentication'
  require 'cloudservers/connection'
  require 'cloudservers/server'
  require 'cloudservers/image'
  require 'cloudservers/flavor'
  require 'cloudservers/shared_ip_group'
  require 'cloudservers/exception'
  
  # Constants that set limits on server creation
  MAX_PERSONALITY_ITEMS = 5
  MAX_PERSONALITY_FILE_SIZE = 10240
  MAX_SERVER_PATH_LENGTH = 255
  MAX_PERSONALITY_METADATA_ITEMS = 5

end

class String
  # Monkey-patch the String class to get a method that will capitalize the first letter
  def upcase_first
    self[0].chr.capitalize + self[1, size]
  end
end