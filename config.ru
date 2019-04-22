require 'sinatra'
require 'rubygems'
require 'shotgun'

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
run ApplicationController