# frozen_string_literal: true

elements = './data/elements.yml'
EL = YAML.safe_load(File.read(elements))

data  = './data/data.yml'
DATA = YAML.safe_load(File.read(data))