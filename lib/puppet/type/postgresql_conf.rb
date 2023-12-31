# frozen_string_literal: true

Puppet::Type.newtype(:postgresql_conf) do
  @doc = 'This type allows puppet to manage postgresql.conf parameters.'

  ensurable

  newparam(:name) do
    desc 'The postgresql parameter name to manage.'
    isnamevar

    newvalues(%r{^[\w.]+$})
  end

  newproperty(:value) do
    desc 'The value to set for this parameter.'
  end

  newproperty(:target) do
    desc 'The path to postgresql.conf'
    defaultto do
      if @resource.class.defaultprovider.ancestors.include?(Puppet::Provider::ParsedFile)
        @resource.class.defaultprovider.default_target
      else
        nil
      end
    end
  end
end
