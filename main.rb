#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'net/https'
require 'uri'
require 'json'
require 'gir_ffi'

=begin
斗鱼api的资料太少了，只能用友邻这个骚操作来替代一下啦
=end

GirFFI.setup :Notify
Notify.init("小天使开播了！")
#默认当前不在直播

curStatus = false

puts 'starting monitor hanser...'

while true do
  uri = URI.parse('https://www.douyu.com/japi/anchorfriend/api/getAnchorFriends?rid=52004')
  res = Net::HTTP.post_form(uri,{})

  resbody = JSON.parse(res.body)
  list = resbody["data"]["list"]
  hanser = list.filter{|zb|zb["rid"]==2550505}[0]
  isLive = hanser["isLive"]==1
  roomTitle = hanser["roomTitle"]
  #puts 'hanser is live' if isLive
  #puts 'hanser is not live' if !isLive
  if isLive!=curStatus then 
    if isLive then
      message = Notify::Notification.new("小天使开播了！", hanser["roomTitle"], "dialog-information")
      message.show
      curStatus = !curStatus
    else
      message = Notify::Notification.new("小天使关播了", hanser["roomTitle"], "dialog-information")
      message.show
      curStatus = !curStatus
    end
  end
  sleep(10)
end
