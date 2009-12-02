function []=seizmo_template(data,varargin)
%SEIZMO_TEMPLATE    Template of SEIZMO functions
%
%    Usage:    []=seizmo_template(data)
%
%    Description: []=SEIZMO_TEMPLATE(DATA) is a start point for a SEIZMO
%     function.
%
%    Notes:
%     - something not mentioned above but still important
%
%    Examples:
%     Blah:
%      seizmo_template
%
%    See also: SOME_FUNCTION

%     Version History:
%        Jan.  1, 2009 - initial version
%
%     Written by Garrett Euler (ggeuler at wustl dot edu)
%     Last Updated Jan.  1, 2009 at 00:00 GMT

% todo:
% - stuff to do

% check nargin
msg=nargchk(2,4,nargin);
if(~isempty(msg)); error(msg); end

% check data structure
msg=seizmocheck(data,'dep');
if(~isempty(msg)); error(msg.identifier,msg.message); end

% turn off struct checking
oldseizmocheckstate=get_seizmocheck_state;
set_seizmocheck_state(false);

% attempt header check
try
    % check header
    data=checkheader(data);
    
    % turn off header checking
    oldcheckheaderstate=get_checkheader_state;
    set_checkheader_state(false);
catch
    % toggle checking back
    set_seizmocheck_state(oldseizmocheckstate);
    
    % rethrow error
    error(lasterror)
end

% get global
global SEIZMO

% attempt rest
try
    % number of records
    nrecs=numel(data);
    
    % valid values for options
    valid.THING2={'opt1' 'opt2' 'opt3'};
    
    % option defaults
    option.THING1=3; % units, range
    option.THING2='opt1'; % opt1/opt2/opt3
    option.THING3=false; % turn on/off something
    
    % id funtion
    me=mfilename;
    pkgme=['seizmo:' me ':'];
    
    % get options from SEIZMO global
    ME=upper(me);
    try
        fields=fieldnames(SEIZMO.(ME));
        for i=1:numel(fields)
            if(~isempty(SEIZMO.(ME).(fields{i})))
                option.(fields{i})=SEIZMO.(ME).(fields{i});
            end
        end
    catch
    end
    
    % get options from command line
    for i=1:2:nargin-1
        if(~ischar(varargin{i}))
            error([pkgme 'badInput'],...
                'Options must be specified as a string!');
        end
        if(~isempty(varargin{i+1}))
            option.(upper(varargin{i}))=varargin{i+1};
        end
    end
    
    % get header info
    [b,e,delta,npts,ncmp]=getheader(data,'b','e','delta','npts','ncmp');
    
    % loop over records
    depmin=nan(nrecs,1); depmen=depmin; depmax=depmin;
    for i=1:nrecs
        
    end
    
    % update headers
    data=changeheader(data,...
        'depmin',depmin,'depmen',depmen,'depmax',depmax);
    
    % toggle checking back
    set_seizmocheck_state(oldseizmocheckstate);
    set_checkheader_state(oldcheckheaderstate);
catch
    % toggle checking back
    set_seizmocheck_state(oldseizmocheckstate);
    set_checkheader_state(oldcheckheaderstate);
    
    % rethrow error
    error(lasterror)
end

end
