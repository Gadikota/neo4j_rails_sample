class Api::V1::MeetingsController < Api::V1::BaseController

  def index
    http = Curl.post("https://api.zoom.us/v1/meeting/live", {api_key: ENV["api_key"], api_secret: ENV["api_secret"]})
    @meetings = JSON.parse(http.body)
    http = Curl.post("https://api.zoom.us/v1/meeting/live", {api_key: ENV["api_key"], api_secret: ENV["api_secret"]})
    @live_meetings = JSON.parse(http.body)
  end

  def create
    http = Curl.post("https://api.zoom.us/v1/meeting/create", {api_key: ENV["api_key"], api_secret: ENV["api_secret"], host_id: ENV["host_id"], topic: params["topic"], type: 1, password: params["password"]})
    meeting = JSON.parse(http.body)
    redirect_to api_v1_meeting_path(method: :get, id: meeting["id"])
  end

  def show
    http = Curl.post("https://api.zoom.us/v1/meeting/get", {api_key: ENV["api_key"], api_secret: ENV["api_secret"], host_id: ENV["host_id"], id: params["id"]})
    @meeting = JSON.parse(http.body)
  end

  def destroy
    http = Curl.post("https://api.zoom.us/v1/meeting/end", {api_key: ENV["api_key"], api_secret: ENV["api_secret"], host_id: ENV["host_id"], id: params["id"]})
    redirect_to api_v1_meetings_path
  end

end