# optional cron jobs

# cron dynamic powersave
cron 'powersave' do
  hour '0'
  minute '0'
  command 'tuned-adm  profile powersave'
end

# cron dynamic profile
cron 'dynamic' do
  hour '6'
  minute '0'
  command 'tuned-adm  profile #{default_profile}'
end