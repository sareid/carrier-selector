class TechnicalReportsController < ApplicationController

  def index
    @carriers = Carrier.all
  end

end
