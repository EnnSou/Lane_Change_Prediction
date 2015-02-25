function GSR_RAW_Data = GSRrawTimeCorection(GSR_RAW_Data, ...
                                            GSR_RAW_Txt, ...
                                            GSR_RAW_start_Time)
    [~, timeIndex] = ismember('DateTime', GSR_RAW_Txt);
    GSR_RAW_Data(:, timeIndex) = GSR_RAW_Data(:, timeIndex) - ...
                                    GSR_RAW_Data(1, timeIndex) + ...
                                    datenum(GSR_RAW_start_Time) - ...
                                    floor(datenum(GSR_RAW_start_Time));
end