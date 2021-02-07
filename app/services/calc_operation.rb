class CalcOperation
  # attr_reader operations

  def initialize
    @operations = [
      {
        operation_type: 'pick_up',
        member_count: 2,
        place: "温泉津地区",
        time: Time.new(2020,1,1,10,10)
      },
      {
        operation_type: 'pick_up',
        member_count: 1,
        place: "出雲市",
        time: Time.new(2020,1,1,10,16)
      },
      {
        operation_type: 'drop_off',
        member_count: 1,
        place: "松江市",
        time: Time.new(2020,1,1,10,20)
      },
      {
        operation_type: 'drop_off',
        member_count: 2,
        place: "大田市",
        time: Time.new(2020,1,1,10,26)
      },
      {
        operation_type: 'pick_up',
        member_count: 2,
        place: "大田市",
        time: Time.new(2020,1,1,12,16)
      },
      {
        operation_type: 'drop_off',
        member_count: 2,
        place: "大田市",
        time: Time.new(2020,1,1,12,26)
      },
      {
        operation_type: 'pick_up',
        member_count: 1,
        place: "大田市",
        time: Time.new(2020,1,1,12,28)
      },
      {
        operation_type: 'drop_off',
        member_count: 1,
        place: "大田市",
        time: Time.new(2020,1,1,12,30)
      }
    ]
  end

  def molding
    total_count = 0
    points = []

   a = @operations.slice_after do |op|
      if op[:operation_type] == "pick_up"
        total_count += op[:member_count]
      else
        total_count -= op[:member_count]
      end

      total_count.zero?
    end.map {|es|
      es.map { |op| { place: op[:place], time: op[:time], member_count: op[:member_count] } }
    }

    a.group_by { |b| b[0][:time].strftime("%H:%M") }
  end

  private

  def points
  end
end