require 'test_helper'

class NightHouseTest < ActiveSupport::TestCase
  def setup
    @nightHouse = NightHouse.new(name: "Example Night House", cnpj: "99.999.999/9999-99", email: "nighthouse@example.com", category: "indie", state: "São Paulo", city: "São Paulo", neighbourhood: "Consolação", address: "Rua Augusta, 1007", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @nightHouse.valid?
  end

  test "name should be present" do
    @nightHouse.name = "     "
    assert_not @nightHouse.valid?
  end

  test "email should be present" do
    @nightHouse.email = "     "
    assert_not @nightHouse.valid?
  end

  test "name should not be too long" do
    @nightHouse.name = "a" * 51
    assert_not @nightHouse.valid?
  end

  test "email should not be too long" do
    @nightHouse.email = "a" * 244 + "@example.com"
    assert_not @nightHouse.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @nightHouse.email = valid_address
      assert @nightHouse.valid?, "#{valid_address.inspect} deve ser válido"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @nightHouse.email = invalid_address
      assert_not @nightHouse.valid?, "#{invalid_address.inspect} deve ser inválido"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @nightHouse.dup
    duplicate_user.email = @nightHouse.email.upcase
    @nightHouse.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @nightHouse.email = mixed_case_email
    @nightHouse.save
    assert_equal mixed_case_email.downcase, @nightHouse.reload.email
  end

  test "password should be present (nonblank)" do
    @nightHouse.password = @nightHouse.password_confirmation = " " * 6
    assert_not @nightHouse.valid?
  end

  test "password should have a minimum length" do
    @nightHouse.password = @nightHouse.password_confirmation = "a" * 5
    assert_not @nightHouse.valid?
  end

end
