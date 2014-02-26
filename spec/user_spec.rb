require 'spec_helper'

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

      u1 = User.new(name: "Danny", password: "1234")
      u2 = User.new(name: "Danny", password: "1234")
      expect(User.where(name: "Danny").count).to eq(1)

      u1 = User.create(name: "Debra", password: "1234")
      u2 = User.create(name: "Debra", password: "1234")
      expect(User.where(name: "Debra").count).to eq(1)
    end

  end
end

