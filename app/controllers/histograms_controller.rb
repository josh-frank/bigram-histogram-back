class HistogramsController < ApplicationController

  def create
    @histogram = Histogram.create( histogram_params )
    if @histogram.errors.present?
      render json: { errors: @histogram.errors.full_messages }, status: 400
    else
      render json: {
        id: @histogram.id,
        corpus: @histogram.corpus,
        histogram: @histogram.to_obj
      }, status: 200 
    end
  end

  def show
    @histogram = Histogram.find( params[ :id ] )
    unless @histogram.nil?
      render json: {
        id: @histogram.id,
        corpus: @histogram.corpus,
        histogram: @histogram.to_obj
      }, status: 200
    else
      render json: { errors: [ "Not found" ] }, status: 403
    end
  end

  private

  def histogram_params
    params.require( :histogram ).permit( :corpus )
  end

end
