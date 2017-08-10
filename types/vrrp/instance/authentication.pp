type Keepalived::Vrrp::Instance::Authentication = Struct[{
  auth_type => Enum['PASS', 'AH'],
  auth_pass => String
}]

