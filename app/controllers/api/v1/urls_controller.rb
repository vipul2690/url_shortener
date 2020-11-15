class Api::V1::UrlsController < ApplicationController
    before_action :find_url, only: [:update, :show, :destory]
    before_action :shorten_url, only: [:create]

    #GET /urls
    def index
        @urls = Url.all
        render json: @urls
    end

    #GET /urls/:id
    def show
        render json: @url
    end

    #POST /urls
    def create
        if @url.save
            render json: @url
        else
            render error: {error: 'Unable to save url data.'}, status: 400
        end
    end

    #PUT /urls/:id
    def update
        if @url
            @url.update(url_params)
            render json: @url, status: 200
        else
            render error: {error: 'Unable to update url data.'}, status: 400
        end
    end

    #DELETE /urls/:id
    def destroy
        if @url
            @url.destroy
            render json: { message: 'Url data deleted successfully'}, status: 200
        else
            render error: {error: 'Unable to delete url data.'}, status: 400
        end
    end

    private

    def url_params
        params.require(:url).permit(:full_url, :short_url, :hits)
    end

    def find_url
        @url = Url.find(params[:id])
    end

    def shorten_url
        @url = Url.new(url_params)
        @url.short_url = url_params[:full_url] ? @url.short : ''
    end
end
