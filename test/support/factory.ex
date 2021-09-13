defmodule DeliverycenterElixir.Factory do
  use ExMachina.Ecto, repo: DeliverycenterElixir.Repo

  @default_json_test_file "priv/payload/payload.json"

  def payload_factory do
    @default_json_test_file
    |> File.read!()
    |> Jason.decode!()
  end

  def address_params_factory do
    %{
      "external_id" => 1_051_695_306,
      "address_line" => "Rua Fake de Testes 3454",
      "street_name" => "Rua Fake de Testes",
      "street_number" => "3454",
      "comment" => "teste",
      "zip_code" => "85045020",
      "city" => "Cidade de Testes",
      "state" => "São Paulo",
      "country" => "BR",
      "neighborhood" => "Vila de Testes",
      "latitude" => -23.629037,
      "longitude" => -46.712689,
      "receiver_phone" => "41999999999"
    }
  end

  def address_failed_params_factory do
    %{
      "external_id" => 1_051_695_306,
      "street_name" => "Rua Fake de Testes",
      "street_number" => "3454",
      "comment" => "teste",
      "zip_code" => "85045020",
      "city" => "Cidade de Testes",
      "state" => "São Paulo",
      "country" => "BR",
      "neighborhood" => "Vila de Testes",
      "latitude" => -23.629037,
      "longitude" => -46.712689,
      "receiver_phone" => "41999999999"
    }
  end

  def customer_params_factory do
    %{
      "external_id" => 136_226_073,
      "nickname" => "JOHN DOE",
      "email" => "john@doe.com",
      "phone" => "41999999999",
      "first_name" => "John",
      "last_name" => "Doe",
      "doc_type" => "CPF",
      "doc_number" => "09487965477"
    }
  end

  def customer_failed_params_factory do
    %{
      "external_id" => 136_226_073,
      "nickname" => "JOHN DOE",
      "email" => "john@doe.com",
      "phone" => "41999999999",
      "first_name" => "John",
      "last_name" => "Doe",
      "doc_type" => "CPF"
    }
  end

  def item_params_factory do
    %{
      "external_id" => "IT4801901403",
      "title" => "Produto de Testes",
      "quantity" => 1,
      "unit_price" => 49.9,
      "full_unit_price" => 49.9
    }
  end

  def item_failed_params_factory do
    %{
      "external_id" => "IT4801901403",
      "quantity" => 1,
      "unit_price" => 49.9,
      "full_unit_price" => 49.9
    }
  end

  def payment_params_factory do
    %{
      "external_id" => 12_312_313,
      "order_id" => 9_987_071,
      "payer_id" => 414_138,
      "installments" => 1,
      "payment_type" => "credit_card",
      "status" => "paid",
      "transaction_amount" => 49.9,
      "taxes_amount" => 0,
      "shipping_cost" => 5.14,
      "total_paid_amount" => 55.04,
      "installment_amount" => 55.04,
      "date_approved" => "2019-06-24T16:45:35.000-04:00",
      "date_created" => "2019-06-24T16:45:33.000-04:00"
    }
  end

  def payment_failed_params_factory do
    %{
      "external_id" => 12_312_313,
      "order_id" => 9_987_071,
      "payer_id" => 414_138,
      "installments" => 1,
      "status" => "paid",
      "transaction_amount" => 49.9,
      "taxes_amount" => 0,
      "shipping_cost" => 5.14,
      "total_paid_amount" => 55.04,
      "installment_amount" => 55.04,
      "date_approved" => "2019-06-24T16:45:35.000-04:00",
      "date_created" => "2019-06-24T16:45:33.000-04:00"
    }
  end

  def order_params_factory do
    %{
      "external_id" => 9_987_071,
      "store_id" => 282,
      "date_created" => "2019-06-24T16:45:32.000-04:00",
      "date_closed" => "2019-06-24T16:45:35.000-04:00",
      "last_updated" => "2019-06-25T13:26:49.000-04:00",
      "total_amount" => 49.9,
      "total_shipping" => 5.14,
      "total_amount_with_shipping" => 55.04,
      "paid_amount" => 55.04,
      "expiration_in_minutes" => 60,
      "expiration_date" => "2019-06-24T17:45:32.000-04:00",
      "status" => "paid"
    }
  end

  def order_failed_params_factory do
    %{
      "external_id" => 9_987_071,
      "store_id" => 282,
      "date_created" => "2019-06-24T16:45:32.000-04:00",
      "date_closed" => "2019-06-24T16:45:35.000-04:00",
      "last_updated" => "2019-06-25T13:26:49.000-04:00",
      "total_amount" => 49.9,
      "total_shipping" => 5.14,
      "total_amount_with_shipping" => 55.04,
      "paid_amount" => 55.04,
      "expiration_in_minutes" => 60,
      "status" => "paid"
    }
  end
end
