# frozen_string_literal: true

ActiveAdmin.register Province do
  permit_params :province_id, :name, :abbreviation, :gst, :pst, :hst, :total_rate
end
