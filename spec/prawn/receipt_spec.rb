require_relative '../spec_helper'

require_relative '../../lib/prawn/receipt'

describe Prawn::Receipt do
  logo_image_path = File.expand_path("../../data/pr-logo.png",
                                     File.dirname(__FILE__))
  before do
    @receipt = Prawn::Receipt.new :logo_image_path => logo_image_path,
                                  :company_name    => "Great Startup",
                                  :company_email   => "support@great-startup.com",
                                  :customer_email  => "no@one.com",
                                  :customer_name   => "noone",
                                  :amount_billed   => "100.00",
                                  :credit_card     => "123-1234-3456",
                                  :transaction_id  => "123"
  end

  it "accept hash options" do
    proc {
      Prawn::Receipt.new
    }.must_raise ArgumentError
  end

  it "store template var to state" do
    @receipt.state.must_equal :logo_image_path => logo_image_path,
                              :company_name    => "Great Startup",
                              :company_email   => "support@great-startup.com",
                              :customer_email  => "no@one.com",
                              :customer_name   => "noone",
                              :amount_billed   => "100.00",
                              :credit_card     => "123-1234-3456",
                              :transaction_id  => "123"
  end

  it "render pdf file" do
    @receipt.render_file "receipt_file.pdf"
  end


end
