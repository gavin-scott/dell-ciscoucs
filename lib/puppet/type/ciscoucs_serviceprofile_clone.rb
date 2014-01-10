Puppet::Type.newtype(:ciscoucs_serviceprofile_clone) do
  @doc = 'This represents clone service profile on cisco ucs'
  ensurable

  newparam(:source_serviceprofile_name, :namevar => true) do
    desc "This parameter describes name of the source service profile"
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is invalid." % value
        end
      end
    end
  end

  newparam(:source_organization) do
    desc "This parameter describes name of the source organization. A valid format is org-root/[sub-organization]/[sub-organization]...."
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is invalid." % value
        end
      end
    end
  end

  newparam(:source_profile_dn) do
    desc "This parameter describes source service profile dn. A valid format is org-root/[sub-organization]/[sub-organization]..../ls-[profile name]"
    validate do |value|
      if value  &&  value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is invalid." % value
        end
      end
    end
  end

  newparam(:target_serviceprofile_name) do
    desc "This parameter describes name of the target service profile"
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is invalid." % value
        end
      end
    end
  end

  newparam(:target_organization) do
    desc "This parameter describes name of the target organization. A valid format is org-root/[sub-organization]/[sub-organization]...."
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is invalid." % value
        end
      end
    end
  end

  newparam(:target_profile_dn) do
    desc "This parameter describes target service profile dn. A valid format is org-root/[sub-organization]/[sub-organization]..../ls-[profile name]"
    validate do |value|
      if value  &&  value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is invalid." % value
        end
      end
    end
  end

  validate do
    if !self[:target_profile_dn] || self[:target_profile_dn].strip.length==0
      # if dn is empty then both org or profile name should exists.
      if (!self[:target_organization] || self[:target_organization].strip.length == 0) || (!self[:target_serviceprofile_name] || self[:target_serviceprofile_name].strip.length == 0)
        raise ArgumentError, "Provide either target profile dn or both target organization and target profile name as input."
      end
    end
    if !self[:source_profile_dn] || self[:source_profile_dn].strip.length==0
          # if dn is empty then both org or profile name should exists.
          if (!self[:source_organization] || self[:source_organization].strip.length == 0) || (!self[:source_serviceprofile_name] || self[:source_serviceprofile_name].strip.length == 0)
            raise ArgumentError, "Provide either source profile dn or both source organization and source profile name as input"
          end
        end
        
  end

end

