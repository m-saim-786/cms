# frozen_string_literal: true

json.array! @fee_details, partial: 'fee_details/fee_detail', as: :fee_detail
