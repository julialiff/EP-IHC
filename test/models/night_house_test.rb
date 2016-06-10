require 'test_helper'

class NightHouseTest < ActiveSupport::TestCase
  def setup
    @night_house = NightHouse.new(name: "Example Night House", cnpj: "99.999.999/9999-99", email: "nighthouse@example.com", category: "indie", state: "São Paulo", city: "São Paulo", neighbourhood: "Consolação", address: "Rua Augusta, 1007", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @night_house.valid?
  end

  test "name should be present" do
    @night_house.name = "     "
    assert_not @night_house.valid?
  end

  test "email should be present" do
    @night_house.email = "     "
    assert_not @night_house.valid?
  end

  test "name should not be too long" do
    @night_house.name = "a" * 51
    assert_not @night_house.valid?
  end

  test "email should not be too long" do
    @night_house.email = "a" * 244 + "@example.com"
    assert_not @night_house.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @night_house.email = valid_address
      assert @night_house.valid?, "#{valid_address.inspect} deve ser válido"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @night_house.email = invalid_address
      assert_not @night_house.valid?, "#{invalid_address.inspect} deve ser inválido"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @night_house.dup
    duplicate_user.email = @night_house.email.upcase
    @night_house.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @night_house.email = mixed_case_email
    @night_house.save
    assert_equal mixed_case_email.downcase, @night_house.reload.email
  end

  test "password should be present (nonblank)" do
    @night_house.password = @night_house.password_confirmation = " " * 6
    assert_not @night_house.valid?
  end

  test "password should have a minimum length" do
    @night_house.password = @night_house.password_confirmation = "a" * 5
    assert_not @night_house.valid?
  end

end
