Ransack.configure do |config|
  config.add_predicate "between",
  arel_predicate: 'between',
  formatter: proc { |v|
  parts = v.split(',')
  OpenStruct.new(begin: parts[0], end: parts[1])
},
  validator: proc { |v| v.present? },
  type: :string
end
