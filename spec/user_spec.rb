require 'spec_helper'
require 'pry'
# To restart the test database, run the following command RACK_ENV=test rake db:create
#You need to have this RACK_ENV=test in front of every database command for it to work on the test database


describe User do

  after do
    User.delete_all
  end

  context "Note to myself: learning rspec" do
    # tests
    it "should have a name" do
      tara = User.new(name: "Tara")
      expect(tara.name).to eq("Tara")
      #create is a spork
      #new and save are fork and spoon
    end

    it "should have a password field" do
      daniel = User.new(name: "Daniel", password: "1234")
      expect(daniel.password).to eq("1234")
    end

    it "should not have duplicate name" do
      # question: when do the validations occur?
      # does it stop models being created? (user 2 doesn't exist?)
      # Does it run on .save / .create?
      # Does it run on .new?

      # u1 = User.new(name: "Danny", password: "1234")
      # u2 = User.new(name: "Danny", password: "1234")
      # expect(User.where(name: "Danny").count).to eq(1)

      u1 = User.create(name: "Debra", password: "1234")
      u2 = User.create(name: "Debra", password: "1234")
      expect(User.where(name: "Debra").count).to eq(1)
    end

    # test user bcrypt stuff

    # what to test?

    # should be able to create user
    # user password not stored in plain text

    it "Password not stored as plain text" do
      alyssa = User.new(name: "Alyssa")
      alyssa.password = "1234"
      alyssa.save!

      db_password = alyssa.password_hash.to_s #ask about this....later?
      expect(db_password != "1234").to be_true
    end

    # test user login, test comparison of hashed password

    it "Check that entered plain text password is equivalent to stored hash password" do
      alyssa = User.new(name: "Alyssa")
      alyssa.password = "1234"
      alyssa.save!

      expect(alyssa.password).to eq("1234")
    end

  end
end

