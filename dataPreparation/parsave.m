function parsave(fname, prepedGSR, prepedECG, prepedRSP, ...
                        prepedGSRraw, prepedECGraw, ...
                        prepedRSPraw, prepedOBD, prepedTarget)
    save(fname, 'prepedGSR', 'prepedECG', 'prepedRSP', 'prepedGSRraw', ...
                'prepedECGraw', 'prepedRSPraw', 'prepedOBD', 'prepedTarget');
end