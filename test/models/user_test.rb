require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example User", email: "usuario@example.com", cellphone: "1198765-4321",
                     birth_date: "01/01/1996", occupation: "engineer", college: "usp", state: "São Paulo",
                     city: "São Paulo", neighbourhood: "Tatuapé", password: "foobar",
                     password_confirmation: "foobar")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "cellphone should be present" do
    @user.cellphone = "     "
    assert_not @user.valid?
  end

  test "birth_date should be present" do
    @user.birth_date = "     "
    assert_not @user.valid?
  end

  test "occupation should be present" do
    @user.occupation = "     "
    assert_not @user.valid?
  end

  test "college should be present" do
    @user.college = "     "
    assert_not @user.valid?
  end

  test "state should be present" do
    @user.state = "     "
    assert_not @user.valid?
  end

  test "city should be present" do
    @user.city = "     "
    assert_not @user.valid?
  end

  test "neighbourhood should be present" do
    @user.neighbourhood = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} deve ser válido"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} deve ser inválido"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
