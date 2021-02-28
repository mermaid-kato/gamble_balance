class BalancesController < ApplicationController
  def index
    calc_operation = CalcOperation.new

    @operation_plans = calc_operation.molding
    @operation_results = calc_operation.molding
  end
end
