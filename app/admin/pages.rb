# frozen_string_literal: true

ActiveAdmin.register Page do
  permit_params :title, :content, :permalink
end
