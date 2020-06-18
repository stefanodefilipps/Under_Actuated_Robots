% Run each section separately for Partial Feedback Linearization Controller of Acrobot
% Collocated and Non-Collocated Case

%% Non-Collocated Case

InitModel4Acro
lqr_acro

sim('acro_partial_feed_noncolacated')

plots

%% Collocated-Case

InitModel4Acro_coloc
lqr_acro

sim('acro_partial_feed_colocated')

plots