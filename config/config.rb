require 'yaml'

# Config class
class Config
  def self.get
    YAML.load_file('./config/config.yml')
  end
end
